<?php
namespace Vendor\Hiland\Utils\Data;

/**
 * Abstract class that enables creation of PHP enums.
 * All you
 * have to do is extend this class and define some constants.
 * Enum is an object with value from on of those constants
 * (or from on of superclass if any). There is also
 * __default constat that enables you creation of object
 * without passing enum value.
 *
 * @author Marijan Šuflaj <msufflaj32@gmail.com&gt
 * @link http://www.php4every1.com/scripts/php-enum/
 */
abstract class Enum
{

    /**
     * Constant with default value for creating enum object
     */
    const __default = null;
    private static $constants = array();
    private $value;
    private $strict;

    /**
     * Creates new enum object.
     * If child class overrides __construct(),
     * it is required to call parent::__construct() in order for this
     * class to work as expected.
     *
     * @param mixed $initialValue
     *            Any value that is exists in defined constants
     * @param bool $strict
     *            If set to true, type and value must be equal
     * @throws \UnexpectedValueException If value is not valid enum value
     */
    public function __construct($initialValue = null, $strict = true)
    {
        $class = get_class($this);

        if (!array_key_exists($class, self::$constants)) {
            self::populateConstants();
        }

        if ($initialValue === null) {
            $initialValue = self::$constants[$class]["__default"];
        }

        $temp = self::$constants[$class];

        if (!in_array($initialValue, $temp, $strict)) {
            throw new \UnexpectedValueException("Value is not in enum " . $class);
        }

        $this->value = $initialValue;
        $this->strict = $strict;
    }

    /**
     * Returns list of all defined constants in enum class.
     * Constants value are enum values.
     *
     * @param bool $includeDefault
     *            If true, default value is included into return
     * @return array Array with constant values
     */
    public function getConstList($includeDefault = false)
    {
        $class = get_class($this);

        if (!array_key_exists($class, self::$constants)) {
            self::populateConstants();
        }

        return $includeDefault ? array_merge(self::$constants[__CLASS__], array(
            "__default" => self::__default
        )) : self::$constants[__CLASS__];
    }

    private function populateConstants()
    {
        $class = get_class($this);

        $r = new \ReflectionClass($class);

        $constants = $r->getConstants();

        self::$constants = array(
            $class => $constants
        );
    }

    /**
     * Returns string representation of an enum.
     * Defaults to
     * value casted to string.
     *
     * @return string String representation of this enum's value
     */
    public function __toString()
    {
        return (string)$this->value;
    }

    /**
     * Checks if two enums are equal.
     * Only value is checked, not class type also.
     * If enum was created with $strict = true, then strict comparison applies
     * here also.
     * @param mixed $object
     * @return bool True if enums are equal
     */
    public function equals($object)
    {
        if (!($object instanceof Enum)) {
            return false;
        }

        return $this->strict ? ($this->value === $object->value) : ($this->value == $object->value);
    }
}

?>